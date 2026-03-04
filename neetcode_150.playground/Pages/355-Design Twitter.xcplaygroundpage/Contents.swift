import Foundation

//https://leetcode.com/problems/design-twitter/description/


class Twitter {
    struct Tweet {
        let id: Int
        let time: Int
    }
    var time: Int
    var tweets: [Int: [Tweet]] // userId -> Tweets posted
    var followerMaps: [Int: Set<Int>] // userId -> following userIds

    init() {
        time = 0
        tweets = [:]
        followerMaps = [:]
    }

    func postTweet(_ userId: Int, _ tweetId: Int) {
        var userTweets = tweets[userId, default: []]
        userTweets.append(Tweet(id: tweetId, time: time))
        if userTweets.count > 10 {
            userTweets.removeFirst()
        }
        tweets[userId] = userTweets
        time += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var following = followerMaps[userId, default: []]
        following.insert(userId)

        // oldest tweets say on top
        var heap: Heap<Tweet> = Heap { l, r in
            l.time < r.time
        }
        for user in following {
            for tweet in tweets[user, default: []] {
                heap.insert(item: tweet)
                if heap.count > 10 {
                    heap.popTop()
                }
            }
        }
        var res: [Int] = []
        while !heap.isEmpty {
            res.insert(heap.popTop()!.id, at: 0)
        }
        return res
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        followerMaps[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followerMaps[followerId, default: []].remove(followeeId)
    }
}

struct Heap<T> {
    typealias HeapComparator = (_ l: T, _ r: T) -> Bool

    private(set) var heap = [T]()

    var count: Int {
        heap.count
    }

    var isEmpty: Bool {
        heap.isEmpty
    }

    var isNotEmpty: Bool {
        !heap.isEmpty
    }

    private let comparator: HeapComparator

    init(comparator: @escaping HeapComparator) {
        self.comparator = comparator
    }

    private func getParentIdx(child: Int) -> Int? {
        guard child >= 0 && child < count else {
            print("Heap: getParentIdx: Index Out of bounds")
            return nil
        }
        let idx = (child - 1)/2
        return idx >= 0 ? idx : nil
    }

    private func getLeftChildIdx(parent: Int) -> Int? {
        guard parent >= 0 && parent < count else {
            print("Heap: getLeftChildIdx: Index Out of bounds")
            return nil
        }
        let idx = 2 * parent + 1
        return idx < count ? idx : nil
    }

    private func getRightChildIdx(parent: Int) -> Int? {
        guard parent >= 0 && parent < count else {
            print("Heap: getRightChildIdx: Index Out of bounds")
            return nil
        }
        let idx = 2 * parent + 2
        return idx < count ? idx : nil
    }

    private mutating func swapHeapAt(idx1: Int, idx2: Int) {
        guard idx1 >= 0 && idx1 < count && idx2 >= 0 && idx2 < count else {
            print("Heap: SwapHeapAt: Index Out of bounds")
            return
        }
        let temp = heap[idx1]
        heap[idx1] = heap[idx2]
        heap[idx2] = temp
    }

    private mutating func bubbleUp(idx: Int) {
        guard let parent = getParentIdx(child: idx) else {
            return
        }
        if comparator(heap[idx], heap[parent]) {
            swapHeapAt(idx1: idx, idx2: parent)
            bubbleUp(idx: parent)
        }
    }

    private mutating func heapify(idx: Int) {
        var comp = idx
        if let left = getLeftChildIdx(parent: idx), comparator(heap[left], heap[comp]) {
            comp = left
        }
        if let right = getRightChildIdx(parent: idx), comparator(heap[right], heap[comp]) {
            comp = right
        }
        if comp != idx {
            swapHeapAt(idx1: comp, idx2: idx)
            heapify(idx: comp)
        }
    }

    public mutating func insert(item: T) {
        heap.append(item)
        bubbleUp(idx: count - 1)
    }

    public func getTop() -> T? {
        return heap.first
    }

    public mutating func popTop() -> T? {
        guard !isEmpty else { return nil }
        let item = heap.first
        if count > 1 {
            heap[0] = heap.removeLast()
            heapify(idx: 0)
        } else {
            heap.removeLast()
        }
        return item
    }
}

