From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/2] leds: trigger: gpio: Add update point / use threaded
 IRQ
Date: Mon, 29 May 2017 22:08:11 +0200
Message-ID: <e80c522c-71d8-936e-0e6c-1c426b79326a@gmail.com>
References: <cover.1495804666.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36774 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751164AbdE2UJA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2017 16:09:00 -0400
In-Reply-To: <cover.1495804666.git.jan.kiszka@siemens.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>

Hi Jan,

Thanks for the patch set.

On 05/26/2017 03:17 PM, Jan Kiszka wrote:
> See patches for details.
> 
> Jan Kiszka (2):
>   leds: trigger: gpio: Refresh LED state after GPIO change
>   leds: trigger: gpio: Use threaded IRQ
> 
>  drivers/leds/trigger/ledtrig-gpio.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)

Both patches applied to the for-next branch of linux-leds.git,
along with Andy's acks.

-- 
Best regards,
Jacek Anaszewski
