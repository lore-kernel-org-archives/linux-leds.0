From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: MAINTAINERS has a AS3645A LED FLASH duplicated section in -next
Date: Thu, 02 Nov 2017 04:24:19 +0200
Message-ID: <15893854.LnnCGWFPPP@avalon>
References: <1509587669.31043.66.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53737 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751628AbdKBCYU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Nov 2017 22:24:20 -0400
In-Reply-To: <1509587669.31043.66.camel@perches.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Joe,

On Thursday, 2 November 2017 03:54:29 EET Joe Perches wrote:
> MAINTAINERS is not supposed to have duplicated sections.
> Can you both please resolve this?

Sure.

Sakari, your plan was to drop drivers/media/i2c/as3645a.c if I recall 
correctly. Do you still want to proceed with that, or should we just rename 
one of the entries in MAINTAINERS ?

> AS3645A LED FLASH CONTROLLER DRIVER
> M:	Sakari Ailus <sakari.ailus@iki.fi>
> L:	linux-leds@vger.kernel.org
> S:	Maintained
> F:	drivers/leds/leds-as3645a.c
> 
> AS3645A LED FLASH CONTROLLER DRIVER
> M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> L:	linux-media@vger.kernel.org
> T:	git git://linuxtv.org/media_tree.git
> S:	Maintained
> F:	drivers/media/i2c/as3645a.c
> F:	include/media/i2c/as3645a.h

-- 
Regards,

Laurent Pinchart
