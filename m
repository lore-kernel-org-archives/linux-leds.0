From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: oneshot - Allow default delay to be passed as an
 argument
Date: Sat, 3 Sep 2016 20:12:19 +0200
Message-ID: <d6bd7a38-8f85-e9fe-7b23-b2568757624f@gmail.com>
References: <20160903090331.GA15375@ami-desktop>
 <590baa53-8426-d2dc-803d-752bf6082c20@gmail.com>
 <CABKcAmXSwgMbopurjrNU7fgPu58W-ZDbDi6VuUn2P2zOGATYLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32929 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753910AbcICSNH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 14:13:07 -0400
Received: by mail-wm0-f65.google.com with SMTP id w207so7170295wmw.0
        for <linux-leds@vger.kernel.org>; Sat, 03 Sep 2016 11:12:58 -0700 (PDT)
In-Reply-To: <CABKcAmXSwgMbopurjrNU7fgPu58W-ZDbDi6VuUn2P2zOGATYLQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Amitesh Singh <singh.amitesh@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

On 09/03/2016 05:35 PM, Amitesh Singh wrote:
> Hello Jacek,
>
>
> On Sat, Sep 3, 2016 at 7:14 PM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com <mailto:jacek.anaszewski@gmail.com>> wrote:
>
>     Hi Amitesh,
>
>
>     On 09/03/2016 11:03 AM, Amitesh Singh wrote:
>
>         This patch facilates the blink delay to be passed as
>         an argument at the time of module loading.
>         e.g.
>         insmod ledtrigg-oneshot.ko default_delay=100
>         ---
>          drivers/leds/trigger/ledtrig-oneshot.c | 7 +++++--
>          1 file changed, 5 insertions(+), 2 deletions(-)
>
>         diff --git a/drivers/leds/trigger/ledtrig-oneshot.c
>         b/drivers/leds/trigger/ledtrig-oneshot.c
>         index b8ea9f0..95933a1 100644
>         --- a/drivers/leds/trigger/ledtrig-oneshot.c
>         +++ b/drivers/leds/trigger/ledtrig-oneshot.c
>         @@ -22,6 +22,9 @@
>
>          #define DEFAULT_DELAY 100
>
>         +static unsigned long default_delay = DEFAULT_DELAY;
>         +module_param(default_delay, ulong, S_IRUGO|S_IWUSR);
>         +
>          struct oneshot_trig_data {
>                 unsigned int invert;
>          };
>         @@ -146,8 +149,8 @@ static void oneshot_trig_activate(struct
>         led_classdev *led_cdev)
>                 if (rc)
>                         goto err_out_invert;
>
>         -       led_cdev->blink_delay_on = DEFAULT_DELAY;
>         -       led_cdev->blink_delay_off = DEFAULT_DELAY;
>         +       led_cdev->blink_delay_on = default_delay;
>         +       led_cdev->blink_delay_off = default_delay;
>
>                 led_cdev->activated = true;
>
>
>
>
>     Why do you need this module parameter? You can change
>     delay_on and delay_off values from sysfs.
>
> Yes, indeed. If someone wants to change blink_delay, he has to change
> both delay_on and delay_off in case you want to blink with constant time
> ON and OFF (1 / (T + T) = 1/2T)
> This patch facilitates you to modify delay in one step in case of delay
> on and off are same which I think, is most used case.

I don't think this is real improvement. We spare two sysfs file
write operations only in case the default_delay param value passed
on module loading won't need to be altered later on.

Moreover, three sysfs file writes needed for configuring oneshot
trigger (e.g. echo "oneshot" > trigger; echo 100 > delay_on;
echo 50 > delay_off) are not too expensive taking into account
usual frequency of setting LED trigger (surely less often than
once per second).

-- 
Best regards,
Jacek Anaszewski
