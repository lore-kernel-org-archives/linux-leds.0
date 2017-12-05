From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/RFC v2] leds: trigger: Introduce a NETDEV trigger
Date: Tue, 5 Dec 2017 21:38:31 +0100
Message-ID: <6cad314f-3cef-ec74-b55e-cccae28da4ab@gmail.com>
References: <1512472751-10928-1-git-send-email-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512472751-10928-1-git-send-email-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Ben,

On 12/05/2017 12:19 PM, Ben Whitten wrote:
> From: Ben Whitten <ben.whitten@gmail.com>
> 
> The patch was converted to led_blink_oneshot, in doing so we find that the
> behaviour has changed. As I dont want to break 'userspace' led behaviour this
> patch shouldn't be merged as is. Open to suggestions.
> 
> Given an interval of 50ms and heavy throughput, the previous implementation
> produced a blink with 100ms period and 50% dutycycle. The led_blink_oneshot
> version produces a blink with 140ms period and 57% dutycycle.

Please check if the LED class driver you're testing the trigger with
implements blink_set op. If yes it would be good to check if it doesn't
align the delay intervals to the hardware capabilities instead of
failing and relying on a LED core software blink fallback.


> I assume a fudge factor on the oneshot delay to bring the period back to 100ms
> would be device specific so not suitable.
> 
> Kind regards,
> Ben Whitten (1):
>   leds: trigger: Introduce a NETDEV trigger
> 
>  .../ABI/testing/sysfs-class-led-trigger-netdev     |  45 ++
>  drivers/leds/trigger/Kconfig                       |   7 +
>  drivers/leds/trigger/Makefile                      |   1 +
>  drivers/leds/trigger/ledtrig-netdev.c              | 507 +++++++++++++++++++++
>  4 files changed, 560 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-netdev
>  create mode 100644 drivers/leds/trigger/ledtrig-netdev.c
> 

-- 
Best regards,
Jacek Anaszewski
