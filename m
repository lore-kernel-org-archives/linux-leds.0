From: Ben Whitten <ben.whitten@gmail.com>
Subject: Re: [PATCH/RFC v2] leds: trigger: Introduce a NETDEV trigger
Date: Wed, 6 Dec 2017 20:07:41 +0000
Message-ID: <CAF3==iviGYd6q1FSjYarJ46ODgPMUN8dby==02Yk5fHztTdd5w@mail.gmail.com>
References: <1512472751-10928-1-git-send-email-ben.whitten@lairdtech.com> <6cad314f-3cef-ec74-b55e-cccae28da4ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36412 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752132AbdLFUHn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Dec 2017 15:07:43 -0500
In-Reply-To: <6cad314f-3cef-ec74-b55e-cccae28da4ab@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hi Jacek,

On 5 December 2017 at 20:38, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi Ben,
>
> On 12/05/2017 12:19 PM, Ben Whitten wrote:
>> From: Ben Whitten <ben.whitten@gmail.com>
>>
>> The patch was converted to led_blink_oneshot, in doing so we find that the
>> behaviour has changed. As I dont want to break 'userspace' led behaviour this
>> patch shouldn't be merged as is. Open to suggestions.
>>
>> Given an interval of 50ms and heavy throughput, the previous implementation
>> produced a blink with 100ms period and 50% dutycycle. The led_blink_oneshot
>> version produces a blink with 140ms period and 57% dutycycle.
>
> Please check if the LED class driver you're testing the trigger with
> implements blink_set op. If yes it would be good to check if it doesn't
> align the delay intervals to the hardware capabilities instead of
> failing and relying on a LED core software blink fallback.

The led are using gpio-led set from device tree on an embedded system, sama5
based. So as far as I can tell blink_op is NULL in this case and it
then relies on
software for the blink in the form of timers.
I assume its the jiffies playing a part here, taking a jiffy or two to
queue up a flash
may add 10ms to the desired 50ms delay_on/delay_off that I am seeing. Then the
extra time may be due to the stats workqueue not aligning with the
blink timer to
kick it off again.

Best regards,
Ben
