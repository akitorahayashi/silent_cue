import ComposableArchitecture
import SwiftUI

struct CountdownView: View {
    let store: StoreOf<TimerReducer>

    var body: some View {
        WithViewStore(store, observe: { $0 }, content: { viewStore in
            VStack {
                Spacer()

                TimeDisplayView(displayTime: viewStore.displayTime, remainingSeconds: viewStore.remainingSeconds)

                Spacer()

                CancelButtonView {
                    viewStore.send(.cancelTimer)
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                if viewStore.isRunning {
                    viewStore.send(.updateTimerDisplay)
                }
            }
        })
    }
}
