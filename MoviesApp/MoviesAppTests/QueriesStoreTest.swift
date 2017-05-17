//
//  QueriesStoreTest.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/16/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import Quick
import Nimble
@testable import MoviesApp

class QueriesStoreTest: QuickSpec {
    
    override func spec() {
        class MockRecentQueriesStorageManager: StoreMapManagerProtocol {
            
            private var defaults = [String: Any?]()
            
            func saveObject(_ object: Any?, forKey key: StoreMap.Keys) {
                defaults[key.rawValue] = object
            }
            func loadObjectForKey(_ key: StoreMap.Keys) -> Any? {
                return defaults[key.rawValue] ?? nil
            }
            func removeObjectForKey(_ key: StoreMap.Keys) {
                defaults[key.rawValue] = nil
            }
        }
        
        let store = RecentQueriesStore(storageManager: MockRecentQueriesStorageManager())
        
        describe("Queries Store") {
            context("when created", { 
                
                it("should have empty queries") {
                    expect(store.recentQueries().count).to(equal(0))
                }
            })
            
            context("validate store operations", { 
                it("should store queries", closure: { 
                    store.addQuery("Batman")
                    store.addQuery("Superman")
                    store.addQuery("Inception")
                    
                    expect(store.recentQueries().count).to(equal(3))
                })
                
                it("should store maximum 10 queries", closure: { 
                    store.addQuery("mission")
                    store.addQuery("Love")
                    store.addQuery("Star")
                    store.addQuery("network")
                    store.addQuery("social")
                    store.addQuery("Paris")
                    store.addQuery("matrix")
                    store.addQuery("logan")
                    store.addQuery("button")
                    
                    expect(store.recentQueries().count).to(equal(store.maximumResults))
                })
                
                it("removes all properly", closure: { 
                    store.removeAllQueries()
                    expect(store.recentQueries()).to(beEmpty())
                })
                
                it("disallow duplicates", closure: { 
                    store.addQuery("Batman")
                    store.addQuery("Batman")
                    store.addQuery("Batman")
                    expect(store.recentQueries().count).to(equal(1))
                })
                
                it("adds the recent the query at the top", closure: { 
                    store.addQuery("Fast")
                    expect(store.recentQueries().first).to(equal("Fast"))
                })
            })
        }
    }
}
