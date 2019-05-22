From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date: Wed, 22 May 2019 21:01:49 +0200
Message-ID: <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522054256.GA4574@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
List-Id: linux-leds@vger.kernel.org

On 5/22/19 7:42 AM, Lee Jones wrote:
> On Tue, 21 May 2019, Jacek Anaszewski wrote:
> 
>> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>>
>>    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
>>
>> for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
>>
>>    leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
>>
>> ----------------------------------------------------------------
>> TI LMU LED support rework and introduction of two new drivers
>> with DT bindings:
>>
>> - leds-lm3697 (entails additions to lm363x-regulator.c)
>> - leds-lm36274
>> ----------------------------------------------------------------
>> Dan Murphy (12):
> 
>>        dt-bindings: mfd: LMU: Add the ramp up/down property
>>        dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>        mfd: ti-lmu: Remove support for LM3697
>>        mfd: ti-lmu: Add LM36274 support to the ti-lmu
> 
> These patches were Acked "for my own reference", which means I'd
> at least expect a discussion on how/where they would be applied.
> 
> It's fine for them to go in via the LED tree in this instance and I do
> thank you for sending a PR.  Next time can we at least agree on the
> route-in though please?

Usually ack from the colliding subsystem maintainer means he
acknowledges the patch and gives silent approval for merging
it via the other tree.

This is the usual workflow e.g. in case of massive reworks
of commonly shared kernel APIs.

Your Acked-for-MFD-by tag is not documented anywhere and I've just
found out about its exact meaning :-) Note also that it percolated
to the mainline git history probably because people mistakenly assumed
it was some new convention (despite that checkpatch.pl complains about
it). So far there are 12 occurrences thereof in git. I must admit that
I once unduly made my contribution to that mess.

Of course, now being taught about the exact meaning of the tag,
I will proceed accordingly.

Regarding this one - please hold on for a while with pulling
the stuff, since we may have some updates from REGULATOR maintainers
(hopefully Acked-by).

-- 
Best regards,
Jacek Anaszewski
