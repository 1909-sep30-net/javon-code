using System;
using Xunit;

namespace Sequences.Tests
{
    class StringSequenceTests
    {
        [Fact]
        public void AddShouldAdd()
        {
            // arrange - any setup necessary to prepare for the behavior to test
            var seq = new StringSequence();

            // act - do the thing you want to test
            seq.Add("abc");

            // assert - verify that the behavior was as expected
            Assert.Equal(expected: "abc", actual: seq[0]);
        }

        [Fact]
        public void AccessOutOfBoundsShouldThrow()
        {
            // arrange
            var seq = new StringSequence();

            // act
            Assert.ThrowsAny<ArgumentOutOfRangeException>(() => seq[0]);
        }
    }
}
