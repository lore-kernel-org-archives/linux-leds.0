From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RESEND PATCH 6/7] leds: Export OF module alias information in
 missing drivers
Date: Tue, 25 Aug 2015 11:13:52 +0200
Message-ID: <55DC31D0.7020800@samsung.com>
References: <1440484277-32675-1-git-send-email-javier@osg.samsung.com>
 <1440484277-32675-7-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440484277-32675-7-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 08/25/2015 08:31 AM, Javier Martinez Canillas wrote:
> The I2C core always reports the MODALIAS uevent as "i2c:<modalias>"
> regardless of the mechanism that was used to register the device
> (i.e: OF or board code) and the table that is used later to match
> the driver with the device (i.e: I2C id table or OF match table).
>
> So drivers needs to export the I2C id table and this be built into
> the module or udev won't have the necessary information to autoload
> the needed driver module when the device is added.
>
> But this means that OF-only drivers needs to have both OF and I2C id
> tables that have to be kept in sync and also the dev node compatible
> manufacturer prefix is stripped when reporting the MODALIAS. Which can
> lead to issues if two vendors use the same I2C device name for example.
>
> To avoid the above, the I2C core behavior may be changed in the future
> to not require an SPI device table for OF-only drivers and report the
> OF module alias. So, it's better to also export the OF table even when
> is unused now to prevent breaking module loading when the core changes.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>
> ---
>
>   drivers/leds/leds-pca963x.c | 1 +
>   drivers/leds/leds-tca6507.c | 1 +
>   2 files changed, 2 insertions(+)

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
