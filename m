From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date: Wed, 29 May 2019 22:44:39 +0200
Message-ID: <5589b6b4-2bbc-a0ef-9c9f-a3ec161b773b@gmail.com>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
 <0340dce2-87fb-938d-615e-376e29f37b54@gmail.com>
 <20190522190225.GH8582@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522190225.GH8582@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com
List-Id: linux-leds@vger.kernel.org

On 5/22/19 9:02 PM, Mark Brown wrote:
> On Wed, May 22, 2019 at 08:27:32PM +0200, Jacek Anaszewski wrote:
>> On 5/21/19 11:15 PM, Mark Brown wrote:
>>> On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:
> 
>>>>         regulator: lm363x: Make the gpio register enable flexible
>>>>         regulator: lm363x: Add support for LM36274
> 
>>> Why have these been applied, I haven't reviewed them?  As far as I can
>>> tell they were sent before the merge window so I'd expect a resend at
>>> this point...
> 
>> The patch set have been floating around for some time and besides
> 
> Most of that time as far as I can tell they weren't being posted to
> subsystem maintainers, you can't expect people to be aware of patches
> that they are not being sent and single postings get missed or dropped
> for all sorts of reasons.
> 
>> the v2 you were cc'ed by Dan, I also poked you a week ago for v4 [1].
> 
> That post from a week ago was you copying me into a thread I wasn't CCed
> on saying I should have been sent the patches.  My expectation would
> therefore be that someone would send me the patches, I'm obviously going
> to prioritize patches that actually get sent to me over ones where I
> have to go searching to try to turn up copies.

I admit I should have CC'ed you the exact patches and not only
the cover letter.

>> Don't be surprised that I assumed you simply don't care.
> 
> You have unreasonable expectations here.  At the very least I would have
> expected something along the lines of "hey, you don't seem to have
> looked at these" before you just applied things, and ideally ensuring
> that the patches had actually been sent to everyone with a reasonable
> lead time so there was a good chance that review could happen.

In fact you were notified only of v2 of the patch set AFAICS.
There is indeed a chance it might have gone unnoticed through
your mailbox (or classified otherwise).

I need to be more wary in such cases in the future.

>> Still, we're awaiting your comments
> 
> If someone sends me the patches...
> 
>> [0] https://lkml.org/lkml/2019/4/10/547
>> [1] https://lkml.org/lkml/2019/5/14/717

-- 
Best regards,
Jacek Anaszewski
