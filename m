From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: bcm6328: Handle default-state of LEDs correctly
Date: Wed, 28 Oct 2015 11:56:01 +0100
Message-ID: <5630A9C1.5060907@samsung.com>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: linux-leds@vger.kernel.org

Hi Simon,

On 10/26/2015 01:36 PM, Simon Arlott wrote:
> On Mon, October 26, 2015 08:45, Jacek Anaszewski wrote:
>> Hi Simon,
>>
>> Thanks for the patch. There are conflicts when applying
>> it to the LED tree:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>>
>> Please use it as a code base for your LED development.
>
> This has already been fixed in the devel branch by d19e6b6a0062c86a75365f0715fd079245f6aab9,
> although I think bcm6328_led() should adjust its use of the spinlock
> to only cover reading the register and call bcm6328_led_set() instead
> of copying the code from it.
>

It is also on the for-next branch. Feel free to submit the patch,
if you see the room for improvement.

-- 
Best Regards,
Jacek Anaszewski
