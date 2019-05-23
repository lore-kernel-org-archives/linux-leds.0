From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date: Thu, 23 May 2019 22:07:35 +0200
Message-ID: <e7f332a3-ce4b-a058-74b3-3dfd8bccfbc8@gmail.com>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell> <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
 <20190523083129.GH4574@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523083129.GH4574@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
List-Id: linux-leds@vger.kernel.org

On 5/23/19 10:31 AM, Lee Jones wrote:
> On Wed, 22 May 2019, Jacek Anaszewski wrote:
> 
>> On 5/22/19 7:42 AM, Lee Jones wrote:
>>> On Tue, 21 May 2019, Jacek Anaszewski wrote:
>>>
>>>> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>>>>
>>>>     Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
>>>>
>>>> for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
>>>>
>>>>     leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> TI LMU LED support rework and introduction of two new drivers
>>>> with DT bindings:
>>>>
>>>> - leds-lm3697 (entails additions to lm363x-regulator.c)
>>>> - leds-lm36274
>>>> ----------------------------------------------------------------
>>>> Dan Murphy (12):
>>>
>>>>         dt-bindings: mfd: LMU: Add the ramp up/down property
>>>>         dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>>>         mfd: ti-lmu: Remove support for LM3697
>>>>         mfd: ti-lmu: Add LM36274 support to the ti-lmu
>>>
>>> These patches were Acked "for my own reference", which means I'd
>>> at least expect a discussion on how/where they would be applied.
>>>
>>> It's fine for them to go in via the LED tree in this instance and I do
>>> thank you for sending a PR.  Next time can we at least agree on the
>>> route-in though please?
>>
>> Usually ack from the colliding subsystem maintainer means he
>> acknowledges the patch and gives silent approval for merging
>> it via the other tree.
> 
> Usually the type of Ack you mention takes this form:
> 
>    Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> However, the one I provided looks like this:
> 
>    For my own reference:
>      Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> Which clearly says "for my own reference" and not to be taken as an
> indication that it's okay for the patch(es) to go in via another
> tree.
> 
>> This is the usual workflow e.g. in case of massive reworks
>> of commonly shared kernel APIs.
>>
>> Your Acked-for-MFD-by tag is not documented anywhere and I've just
>> found out about its exact meaning :-) Note also that it percolated
>> to the mainline git history probably because people mistakenly assumed
>> it was some new convention (despite that checkpatch.pl complains about
>> it). So far there are 12 occurrences thereof in git. I must admit that
>> I once unduly made my contribution to that mess.
> 
> Being MFD maintainer presents an uncommon and awkward scenario.  MFD
> is special in that it means we have to work more cross-subsystem than
> most (any?).  The default for MFD related patch-sets which traverse
> multiple subsystem is for them to go in via MFD with Acks from all the
> other maintainers.  I'm always happy to discuss different merge
> strategies, but using the MFD repo is the norm.
> 
> The Acked-*-by you see above came as a result of a conversation
> between myself and Maintainers I work with the most.  It was seen as
> the most succinct way of saying that the patch has been reviewed,
> whilst providing the least amount of confusion w.r.t. whether it's
> okay to be applied to another tree or not.  The "for my own reference"
> should be clear enough that I provide that tag for my own purposes,
> rather than an okay for others to merge it.
> 
>> Of course, now being taught about the exact meaning of the tag,
>> I will proceed accordingly.
> 
> I'd appreciate that, thank you.
> 
>> Regarding this one - please hold on for a while with pulling
>> the stuff, since we may have some updates from REGULATOR maintainers
>> (hopefully Acked-by).
> 
> I haven't pulled this yet, but please bear in mind ...
> 
> Once an immutable branch is created, it should never, ever change.  I
> think this is the second pull-request I've had from you [0] and the
> second one you've wanted to retract.  That should not happen!

This is life - it is always possible that some problems will be
detected in linux-next later in the cycle, either by bots or by other
people.

Some time ago I referred to Linus' message from 2017 discouraging
maintainers from cross-merging their trees, which you didn't find
applicable to existing MFD workflow.

Recently Linus put stress on that again [0].

At the occasion of the situation we have currently, I'd like to clarify
if cross-merges between MFD and other subsystems deserve special
treatment.

So please, if you find it reasonable to proceed with these immutable
branches workflow, I would first prefer to see Linus' approval for that.

> This is precisely why I usually find it better for patches to go in
> via the MFD tree.
> 
> [0] [GIT PULL] LM3532 backlight support improvements and relocation
> 

[0] https://lkml.org/lkml/2019/5/8/820

-- 
Best regards,
Jacek Anaszewski
