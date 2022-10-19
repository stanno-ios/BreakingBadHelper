//
//  QuoteViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/19/22.
//

import Foundation

class QuoteViewModel {
    var imageURLString: String?
    var quote: Quote
    
    var displayAuthor: String {
        return quote.author
    }
    
    var displayQuote: String {
        return quote.quote
    }
    
    init(imageURLString: String?, quote: Quote) {
        self.imageURLString = imageURLString
        self.quote = quote
    }
}
