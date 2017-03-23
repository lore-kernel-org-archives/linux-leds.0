From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: mt6323: Fix an off by one bug in probe
Date: Thu, 23 Mar 2017 20:37:18 +0100
Message-ID: <af65e771-f0ae-193d-5ece-74e76489d726@gmail.com>
References: <20170323104049.GC20154@mwanda> <20170323111655.GA12792@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35658 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751467AbdCWTiF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2017 15:38:05 -0400
In-Reply-To: <20170323111655.GA12792@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

On 03/23/2017 12:16 PM, Pavel Machek wrote:
> On Thu 2017-03-23 13:40:49, Dan Carpenter wrote:
>> It should be ">= MT6323_MAX_LEDS" instead of ">".  Also "reg" is a u32
>> so it can't be negative and we can remove the test for negative values.
>>
>> Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
