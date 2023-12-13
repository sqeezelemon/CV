// CV
// ↳ URLPositions.swift
//
// Created by @sqeezelemon

import Foundation

class URLPositions {
  fileprivate typealias Positions = Dictionary<UUID, Position>
  private var positions: Positions = [:]
  
  public func add(_ url: String, in rect: CGRect, for id: UUID) {
    self.positions[id] = Position(url: url, position: rect)
  }
  
  public func remove(for id: UUID) {
    self.positions.removeValue(forKey: id)
  }
}

extension URLPositions {
  struct Position {
    let url: String
    let position: CGRect
  }
}

extension URLPositions: Sequence {
  struct Iterator: IteratorProtocol {
    private var inner: Positions.Iterator
    
    fileprivate init(_ inner: Positions.Iterator) {
      self.inner = inner
    }
    
    mutating func next() -> Position? {
      inner.next()?.value
    }
  }
  
  func makeIterator() -> Iterator {
    return Iterator(positions.makeIterator())
  }
}
