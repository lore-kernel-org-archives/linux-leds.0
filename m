From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/2] led: is31fl32xx: minor improvements
Date: Tue, 19 Jul 2016 08:59:24 +0200
Message-ID: <578DCFCC.6070304@samsung.com>
References: <cover.1468861410.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56874 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752421AbcGSG72 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jul 2016 02:59:28 -0400
In-reply-to: <cover.1468861410.git.hns@goldelico.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, drivshin.allworx@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>

Hi Nikolaus,

On 07/18/2016 07:03 PM, H. Nikolaus Schaller wrote:
> Changes V2:
> * added tested&acked-by David Rivshin <drivshin@allworx.com> (received off-list)
> * fixes: (received off-list)
>
> 2016-07-18 18:39:40: while developing the is31fl319x driver we found some minor issues relevant in the is31fl32xx driver.
>
> H. Nikolaus Schaller (2):
>    led: is31fl32xx: fix typo in id and match table names
>    led: is31fl32xx: define complete i2c_device_id table
>
>   drivers/leds/leds-is31fl32xx.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
>

Patch set applied, thanks.

-- 
Best regards,
Jacek Anaszewski
