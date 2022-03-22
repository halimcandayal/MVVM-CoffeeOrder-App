//
//  OrderViewModel.swift
//  MVVM CoffeeOrderApp
//
//  Created by Halimcan Dayal on 21.03.2022.
//

import Foundation

class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
        
    }
}

extension OrderListViewModel {
    
    func orderViewModel(at index: Int) -> OrderViewModel{
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    
    let order: Order
}
extension OrderViewModel {
    
    var name: String{
        return self.order.name
    }
    var email: String{
        return self.order.email
    }
    var type: String{
        return self.order.type.rawValue.capitalized
    }
    var size: String{
        return self.order.size.rawValue.capitalized
    }
    
}

extension Order {
    
    static var all: Resource<[Order]> = {
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect")
    }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Encoding error")
        }
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

extension Order {
    
    init?(_ vm: AddOrderViewModel) {
        
        guard let name = vm.name,
        let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
        
              
                
    }
}
