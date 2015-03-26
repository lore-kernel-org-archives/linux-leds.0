From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] DT: leds: Add uniqueness requirement for 'label' property.
Date: Thu, 26 Mar 2015 22:59:03 +0200
Message-ID: <55147317.8010009@iki.fi>
References: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:37489 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752530AbbCZU7v (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Mar 2015 16:59:51 -0400
In-Reply-To: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org

Hi Jacek,

Jacek Anaszewski wrote:
> Label is used for naming LED class devices. Since ePAPR
> doesn't require uniqueness for label properties, it has to be
> explicitly required in the LEDs common bindings documentation.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: devicetree@vger.kernel.org

Thanks for the patch!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@iki.fi
