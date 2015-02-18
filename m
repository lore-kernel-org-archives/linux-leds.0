From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] leds: Introduce devres helper for led_classdev_register
Date: Wed, 18 Feb 2015 12:31:58 -0800
Message-ID: <54E4F6BE.7010506@codeaurora.org>
References: <1424225645-13996-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34946 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751734AbbBRUcA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 18 Feb 2015 15:32:00 -0500
In-Reply-To: <1424225645-13996-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/17/15 18:14, Bjorn Andersson wrote:
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  drivers/leds/led-class.c | 28 ++++++++++++++++++++++++++++
>  include/linux/leds.h     |  2 ++
>  2 files changed, 30 insertions(+)
>
>

Please update Documentation/driver-model/devres.txt as well.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
