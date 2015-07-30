From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: tlc591xx: Remove redundant I2C_FUNC_SMBUS_BYTE_DATA
 functionality check
Date: Thu, 30 Jul 2015 23:00:09 +0200
Message-ID: <55BA9059.2060700@gmail.com>
References: <1437883516.7007.1.camel@ingics.com> <20150726173145.GI2385@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:37649 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbbG3VBz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 30 Jul 2015 17:01:55 -0400
Received: by wibud3 with SMTP id ud3so7613587wib.0
        for <linux-leds@vger.kernel.org>; Thu, 30 Jul 2015 14:01:54 -0700 (PDT)
In-Reply-To: <20150726173145.GI2385@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Axel Lin <axel.lin@ingics.com>
Cc: Bryan Wu <cooloney@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

On 26.07.2015 19:31, Andrew Lunn wrote:
> On Sun, Jul 26, 2015 at 12:05:16PM +0800, Axel Lin wrote:
>> This checking is done by regmap_get_i2c_bus() which is called in
>> devm_regmap_init_i2c().
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
