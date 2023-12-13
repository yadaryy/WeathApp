

import SwiftUI

struct PullToRefresh<Content: View>: UIViewRepresentable {
    var onRefresh: () -> Void
    let content: Content
    
    @Binding var isRefreshing: Bool

    init(isRefreshing: Binding<Bool>, onRefresh: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self._isRefreshing = isRefreshing
        self.onRefresh = onRefresh
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefreshControl), for: .valueChanged)
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        if isRefreshing {
            uiView.refreshControl?.beginRefreshing()
        } else {
            uiView.refreshControl?.endRefreshing()
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject {
        var parent: PullToRefresh
        
        init(_ parent: PullToRefresh) {
            self.parent = parent
        }
        @objc func handleRefreshControl(sender: UIRefreshControl) {
            parent.onRefresh()
            sender.endRefreshing()
        }
    }
}

