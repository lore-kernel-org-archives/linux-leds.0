From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/3] leds: triggers: add support for RGB triggers and a RGB
 version of the heartbeat trigger
Date: Thu, 17 Mar 2016 14:43:58 +0100
Message-ID: <56EAB49E.4090507@samsung.com>
References: <56E59FED.9000708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54945 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbcCQNoD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 17 Mar 2016 09:44:03 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4600KO8RHBG400@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 17 Mar 2016 13:43:59 +0000 (GMT)
In-reply-to: <56E59FED.9000708@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Heiner,

Next time while sending patch sets to the linux-leds list please
cc also linux-kernel@vger.kernel.org list.

Thanks,
Jacek Anaszewski

On 03/13/2016 06:14 PM, Heiner Kallweit wrote:
> This patch series makes use of the recently introduced RGB extension in the
> LED core and adds support for RGB triggers. RGB triggers can be used e.g. to
> display the state of a subsystem using different colors.
>
> As one use case the patch series includes a RGB version of the heartbeat trigger.
>
> Heiner Kallweit (3):
>    leds: triggers: add support for RGB triggers
>    leds: triggers: add led_trigger_range_event for RGB triggers
>    leds: triggers: heartbeat: add RGB version of the trigger
>
>   drivers/leds/led-triggers.c              | 57 ++++++++++++++++++++++++++--
>   drivers/leds/trigger/ledtrig-heartbeat.c | 64 +++++++++++++++++++++++++++++++-
>   include/linux/leds.h                     | 17 +++++++++
>   3 files changed, 134 insertions(+), 4 deletions(-)
>
