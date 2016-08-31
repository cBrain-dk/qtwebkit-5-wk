#ifndef PrintingState_h
#define PrintingState_h

#include "AdjustViewSizeOrNot.h"
#include "FloatSize.h"

namespace WebCore {

class PrintingState
{
private:
    bool m_printing;
    FloatSize m_pageSize;
    FloatSize m_originalPageSize;
    float m_maximumShrinkRatio;
    AdjustViewSizeOrNot m_shouldAdjustViewSize;

public:
    PrintingState()
        : m_printing()
        , m_pageSize()
        , m_originalPageSize()
        , m_maximumShrinkRatio()
        , m_shouldAdjustViewSize()
    {
    }

    PrintingState(bool printing, FloatSize pageSize, FloatSize originalPageSize, float maximumShrinkRatio, AdjustViewSizeOrNot shouldAdjustViewSize)
        : m_printing(printing)
        , m_pageSize(pageSize)
        , m_originalPageSize(originalPageSize)
        , m_maximumShrinkRatio(maximumShrinkRatio)
        , m_shouldAdjustViewSize(shouldAdjustViewSize)
    {
    }

    bool printing() const { return m_printing; }
    FloatSize pageSize() const { return m_pageSize;  }
    FloatSize originalPageSize() const { return m_originalPageSize; }
    float maximumShrinkRatio() const { return m_maximumShrinkRatio; }
    AdjustViewSizeOrNot shouldAdjustViewSize() const { return m_shouldAdjustViewSize; }
};

} // namespace WebCore

#endif // PrintingState_h
