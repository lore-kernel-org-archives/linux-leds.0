From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch v4] leds: add driver for Mellanox systems LEDs
Date: Thu, 08 Sep 2016 12:20:03 +0200
Message-ID: <f1343a15-3553-023f-c492-6364ec79decb@samsung.com>
References: <1473319553-37195-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11532 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934229AbcIHKUH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Sep 2016 06:20:07 -0400
In-reply-to: <1473319553-37195-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: vadimp@mellanox.com, rpurdie@rpsys.net
Cc: dave@treblig.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com

On 09/08/2016 09:25 AM, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>

> diff --git a/Documentation/leds/leds-mlxcpld.txt b/Documentation/leds/leds-mlxcpld.txt
> new file mode 100644
> index 0000000..7b4c2a3
> --- /dev/null
> +++ b/Documentation/leds/leds-mlxcpld.txt
> @@ -0,0 +1,110 @@
> +ver LEDs-mlxcpld

I noticed this only now - is it a stray line or you intended it was
something more meaningful?

> +==========================
> +Driver for Mellanox systems LEDs.
> +Provide system LED support for the nex Mellanox systems:
> +"msx6710", "msx6720", "msb7700", "msn2700", "msx1410",
> +"msn2410", "msb7800", "msn2740", "msn2100".


-- 
Best regards,
Jacek Anaszewski
