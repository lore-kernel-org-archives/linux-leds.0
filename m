From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v6 0/3] Add ktd2692 Flash LED driver using LED Flash class
Date: Fri, 10 Apr 2015 12:29:24 +0530
Message-ID: <552774CC.4040201@gmail.com>
References: <1428648359-23289-1-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:32900 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088AbbDJG7u (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Apr 2015 02:59:50 -0400
In-Reply-To: <1428648359-23289-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 04/10/2015 12:15 PM, Ingi Kim wrote:

> This patch adds ktd2692 Flash LED driver with LED Flash class
>
> Change in v6:
> 	- Change goto label to if-else
> 	- Change DT binding style for LED device binding
>
> Change in v5:
> 	- Clean up the code
> 	- Fix help message of Kconfig
> 	- Fix issue related with regulator and mutex usage
> 	- Remove tab spaces in bindings
>
> Change in v4:
> 	- Clean up the code
> 	- Modify binding documentation of ktd2692
>
> Change in v3:
> 	- Clean up the code
> 	- Add aux gpio pin to control Flash LED
>
> Change in v2:
> 	- Introduction of LED Flash class as Jacek's comment
> 	- Supplement of binding documentation
> 	- Rename gpio control pin and remove unused pin
> 	- Add regulator for the Flash LED
>
> Ingi Kim (3):
>   of: Add vendor prefix for Kinetic technologies
>   leds: ktd2692: add device tree bindings for ktd2692
>   leds: Add ktd2692 flash LED driver
>
>  .../devicetree/bindings/leds/leds-ktd2692.txt      |  40 ++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/leds/Kconfig                               |   9 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-ktd2692.c                        | 408 +++++++++++++++++++++
>  5 files changed, 459 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>  create mode 100644 drivers/leds/leds-ktd2692.c
>
Run checkpatch.pl with --strict option on this series..

./scripts/checkpatch.pl --strict 000*

Reported "CHECK: Alignment should match open parenthesis"..

-- 
Varka Bhadram
