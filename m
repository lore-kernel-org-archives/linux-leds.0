From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] Add LED / GPIO support for the PC Engines APU2.
Date: Mon, 31 Oct 2016 23:18:59 +0100
Message-ID: <5995c213-848f-dfb3-3a86-f6ddd32f87e4@gmail.com>
References: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
 <a0b21db6-aa1b-bcda-ff33-94ce7b3a8c46@gmail.com>
 <c522f9bd-e6e4-1932-30d9-b1cc579d3172@crc.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c522f9bd-e6e4-1932-30d9-b1cc579d3172@crc.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Haigh <netwiz@crc.id.au>, linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On 10/30/2016 02:43 PM, Steven Haigh wrote:
> Thanks for the feedback.
>
> The difficult part here is that these are not my drivers, but are both
> GPL - and I feel should be included upstream.
>
> While I'm not a C coder, I may be able to do minor changes, but this was
> my best effort of putting something together that does actually work -
> but may benefit from the expertise of the associated lists to improve.
>
> On 30/10/16 23:06, Jacek Anaszewski wrote:
>> Hi Steven,
>>
>> Thanks for the patches. Few initial notes:
>>
>> - generally it is preferred to submit patches with "git send-email",
>>   which simplifies review, as the remarks can be added directly in the
>>   code, in a reply to the patch,
>> - if you want do add some overall description of the patch set then you
>>   can add --cover-letter switch which will generate template for this
>>   purpose.
>> - please also use scripts/checkpatch.pl before submission
>> - make sure that the patches are based on the master branch of
>>   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git,
>> - always add on CC the maintainers of the affected kernel subsystems -
>>   this information can be found in the MAINTAINERS file
>> - in case of LED drivers cc also linux-kernel@vger.kernel.org,
>> - subscribe to the mailing list related to the subsystem the patches
>>   are dedicated to, and skim through some recent patches and reviews -
>>   it can allow for eliminating some common problems from your driver
>>   and reducing the number of review iterations.
>>
>> Regarding the patches - gpio-nct5104d.c seems to be targeted for
>> GPIO subsystem - you should add Linus Walleij and
>> linux-gpio@vger.kernel.org on cc.
>
> Correct, the nct5104 is required for the leds-apu2 module. They both
> co-exist to address the LEDs on the PC Engines APU2 board. There are
> requirements for the leds_gpio module on leds-apu2 as well - but I
> couldn't figure out how to reference this.
>
>> For leds-apu2.c - you shouldn't register gpio driver in the LED
>> subsystem but add the relevant dependency in the Kconfig. Nonetheless
>> I can't find gpio-apu2.c driver in the mainline kernel.
>>
>> You should also use devm_led_classdev_register() for registering LED
>> class device. Please follow the design of the other LED class drivers
>> using platform_device_register_simple() for probing.
>
> You've gone above my head here :P
>
> As mentioned, I was hoping it would be possible to get someone to pick
> it up and run with it based on my initial throwing of things together.
>
> If that's not possible, I can keep hunting for someone to clean things
> up a little bit and try again at a later stage?

You should have mentioned your intention in the cover letter. Besides,
linux-leds list is not regularly tracked by most developers -
adding linux-kernel@vger.kernel.org on CC (done) increases the
chance for the response you're looking for, i.e. the person who has the
hardware and personal interest in having these drivers in the
mainline kernel.

-- 
Best regards,
Jacek Anaszewski
