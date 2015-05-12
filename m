From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v9 3/3] leds: Add ktd2692 flash LED driver
Date: Tue, 12 May 2015 14:40:14 +0200
Message-ID: <5551F4AE.9050900@samsung.com>
References: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
 <1431419877-28339-4-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1431419877-28339-4-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Ingi,

On 05/12/2015 10:37 AM, Ingi Kim wrote:
> This patch adds a driver to support the ktd2692 flash LEDs.
> ktd2692 can control flash current by ExpressWire interface.
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>
> ---
>   drivers/leds/Kconfig        |   9 +
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-ktd2692.c | 443 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 453 insertions(+)
>   create mode 100644 drivers/leds/leds-ktd2692.c

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
