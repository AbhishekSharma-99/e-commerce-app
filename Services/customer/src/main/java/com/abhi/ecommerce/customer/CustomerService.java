package com.abhi.ecommerce.customer;

import com.abhi.ecommerce.exception.CustomerNotFoundException;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;


import java.util.List;

import static java.lang.String.*;

@Service
@RequiredArgsConstructor

public class CustomerService {

    private final CustomerRepository customerRepository;

    private final CustomerMapper customerMapper;


    public String createCustomer(@Valid CustomerRequest request) {
        var customer = customerRepository.save(customerMapper.toCustomer(request));
        return customer.getId();
    }

    public void updateCustomer(@Valid CustomerRequest request) {
        var customer = customerRepository.findById(request.id())
                .orElseThrow(() -> new CustomerNotFoundException(
                        format("Cannot update the customer:: No Customer found with provided ID:: %s", request.id())
                ));
        mergeCustomer(customer, request);
        customerRepository.save(customer);

    }

    private void mergeCustomer(Customer customer, @Valid CustomerRequest request) {
        if (StringUtils.isNotBlank(request.firstname())) {
            customer.setFirstname(request.firstname());
        }

        if (StringUtils.isNotBlank(request.lastname())) {
            customer.setLastname(request.lastname());
        }

        if (StringUtils.isNotBlank(request.email())) {
            customer.setEmail(request.email());
        }

        if (request.address() != null) {
            customer.setAddress(request.address());
        }
    }

    public List<CustomerResponse> getAllCustomers() {
        return customerRepository.findAll().stream()
                .map(customerMapper::toCustomerResponse)
                .toList();
    }

    public Boolean existById(String customerId) {
        return customerRepository.findById(customerId)
                .isPresent();
    }

    public CustomerResponse findById(String customerId) {
        return customerRepository.findById(customerId)
                .map(customerMapper::toCustomerResponse)
                .orElseThrow(() -> new CustomerNotFoundException(
                        format("No Customer found with provided ID:: %s", customerId)
                ));
    }

    public void deleteCustomer(String customerId) {
        if (!customerRepository.existsById(customerId)) {
            throw new CustomerNotFoundException(
                    format("Cannot delete the customer:: No Customer found with provided ID:: %s", customerId)
            );
        }
        customerRepository.deleteById(customerId);
    }
}
