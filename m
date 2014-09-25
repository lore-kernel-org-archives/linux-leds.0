From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 3/4] usb: Rename usb-common.c
Date: Thu, 25 Sep 2014 17:03:53 +0200
Message-ID: <20140925150353.GA15325@kroah.com>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
 <1411591401-5874-1-git-send-email-sojka@merica.cz>
 <1411591401-5874-4-git-send-email-sojka@merica.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:60874 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752501AbaIYPEu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 25 Sep 2014 11:04:50 -0400
Content-Disposition: inline
In-Reply-To: <1411591401-5874-4-git-send-email-sojka@merica.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Michal Sojka <sojka@merica.cz>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz

On Wed, Sep 24, 2014 at 10:43:20PM +0200, Michal Sojka wrote:
> In the next commit, we will want the usb-common module to be composed of
> two object files. Since Kbuild cannot "append" another object to an
> existing one, we need to rename usb-common.c to something
> else (common.c) and create usb-common.o by linking the wanted objects
> together. Currently, usb-common.o comprises only common.o.
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>
> Acked-by: Felipe Balbi <balbi@ti.com>
> Tested-by: Felipe Balbi <balbi@ti.com>
> ---
>  drivers/usb/common/Makefile     |   4 +-
>  drivers/usb/common/common.c     | 144 ++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/common/usb-common.c | 144 ----------------------------------------
>  3 files changed, 147 insertions(+), 145 deletions(-)
>  create mode 100644 drivers/usb/common/common.c
>  delete mode 100644 drivers/usb/common/usb-common.c

In the future, please generate a git "move" diff, which makes it easier
to review, and prove that nothing really changed.  It also helps if the
file is a bit different from what you diffed against, which in my case,
was true.

thanks,

greg k-h
