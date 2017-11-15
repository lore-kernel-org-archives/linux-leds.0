From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lm3692x: Introduce LM3692x dual string
 driver
Date: Wed, 15 Nov 2017 14:12:13 -0600
Message-ID: <32edafdd-1d77-0063-6ad2-b59e2388e3cf@ti.com>
References: <20171115193031.28781-1-dmurphy@ti.com>
 <20171115193031.28781-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:43134 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751455AbdKOUMu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Nov 2017 15:12:50 -0500
In-Reply-To: <20171115193031.28781-2-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 11/15/2017 01:30 PM, Dan Murphy wrote:
> Introducing the LM3692x Dual-String white LED driver.
> 
> Data sheet is located
> http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Added data sheet link, fixed linuxdoc format, returned on failure in init
> routine, return on fault_check failure, updated brightness calculation and
> fixed capitalization issue - https://patchwork.kernel.org/patch/10056675/
> 
>  drivers/leds/leds-lm3692x.c | 390 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 390 insertions(+)
>  create mode 100644 drivers/leds/leds-lm3692x.c
> 
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> new file mode 100644
> index 000000000000..9fa7f5a20466

Forgot to add the Makefile and Kconfig so submitting v3 with them included.

<snip>
-- 
------------------
Dan Murphy
