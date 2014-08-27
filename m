From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] usb: Add LED triggers for USB activity
Date: Wed, 27 Aug 2014 12:27:51 -0700
Message-ID: <20140827192751.GC9620@kroah.com>
References: <CAK5ve-Jz7=7uZ3_Qg2bAH9BiGRZ36k-Oj9TNZ-_nAvaq6LGbjA@mail.gmail.com>
 <1409144625-25274-1-git-send-email-sojka@merica.cz>
 <1409144625-25274-3-git-send-email-sojka@merica.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55769 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935238AbaH0T1w (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 Aug 2014 15:27:52 -0400
Content-Disposition: inline
In-Reply-To: <1409144625-25274-3-git-send-email-sojka@merica.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Michal Sojka <sojka@merica.cz>
Cc: linux-usb@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz

On Wed, Aug 27, 2014 at 03:03:45PM +0200, Michal Sojka wrote:
> With this patch, USB activity can be signaled by blinking a LED. There
> are two triggers, one for activity on USB host and one for USB gadget.
> 
> Both trigger should work with all host/device controllers. Tested only
> with musb.
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>
> ---
>  drivers/usb/Kconfig                           | 11 ++++++
>  drivers/usb/common/Makefile                   |  5 ++-
>  drivers/usb/common/{usb-common.c => common.c} |  0

I don't mind renaming files, but don't "hide" it in this patch, do it in
a separate patch please, and then base your next patch on this one.

thanks,

greg k-h
