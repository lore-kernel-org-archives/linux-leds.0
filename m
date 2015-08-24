From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds:lp55xx: use the private data instead of updating I2C
 device platform data
Date: Mon, 24 Aug 2015 10:54:15 +0200
Message-ID: <55DADBB7.5050808@samsung.com>
References: <1440400195-1432-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25197 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbbHXIyS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2015 04:54:18 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTK005DDWQG8F60@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 24 Aug 2015 09:54:16 +0100 (BST)
In-reply-to: <1440400195-1432-1-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: cooloney@gmail.com, Toshi Kikuchi <toshik@chromium.org>, linux-leds@vger.kernel.org

On 08/24/2015 09:09 AM, Milo Kim wrote:
> Currently, lp55xx_of_populate_pdata() allocates lp55xx_platform_data if
> it's null. And it parses the DT and copies values into the
> 'client->dev.platform_data'. This may have architectural issue.
> Platform data is configurable through the DT or I2C board info inside the
> platform area. However, lp55xx common driver changes this configuration
> when it is loaded. So 'client->dev.platform_data' is not null anymore.
> Eventually, the driver initialization is not identical when it's unloaded
> and loaded again.
> The lp55xx common driver should use the private data, 'lp55xx_chip->pdata'
> instead of changing the original platform data.
>
> So, lp55xx_of_populate_pdata() is modified as follows.
> * Do not update 'dev->platform_data'. Return the pointer of new allocated
>     lp55xx_platform_data. Then the driver points it to private data,
>     'lp55xx_chip->pdata'.
> * Each lp55xx driver checks the pointer and handles an error case.
>
> Then, original platform data configuration will be kept regardless of
> loading or unloading the driver.
> The driver allocates the memory and copies them from the DT if it's NULL.
> After the driver is loaded again, 'client->dev.platform_data' is same as
> initial load, so the driver is initialized identically.
>
> Cc: Toshi Kikuchi <toshik@chromium.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>   drivers/leds/leds-lp5521.c        | 11 +++++------
>   drivers/leds/leds-lp5523.c        | 11 +++++------
>   drivers/leds/leds-lp5562.c        | 11 +++++------
>   drivers/leds/leds-lp55xx-common.c | 13 ++++++-------
>   drivers/leds/leds-lp55xx-common.h |  4 ++--
>   drivers/leds/leds-lp8501.c        | 11 +++++------
>   6 files changed, 28 insertions(+), 33 deletions(-)

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
