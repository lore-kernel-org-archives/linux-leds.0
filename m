From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch 14/32] greybus: LED driver
Date: Fri, 7 Oct 2016 15:41:24 +0200
Message-ID: <20161007134124.GA23851@kroah.com>
References: <20160914100949.GA6179@kroah.com>
 <20160916064058.GA17821@kroah.com>
 <20160916141014.GB1252@kroah.com>
 <20161007133656.GA19976@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56074 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752385AbcJGNmD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Oct 2016 09:42:03 -0400
Content-Disposition: inline
In-Reply-To: <20161007133656.GA19976@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Johan Hovold <johan@hovoldconsulting.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sandeep Patil <sspatil@google.com>, Matt Porter <mporter@kernel.crashing.org>, John Stultz <john.stultz@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Alex Elder <elder@linaro.org>, David Lin <dtwlin@google.com>, Bryan O'Donoghue <pure.logic@nexus-software.ie>, Vaibhav Agarwal <vaibhav.agarwal@linaro.org>, Mark Greer <mgreer@animalcreek.com>, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org

On Fri, Oct 07, 2016 at 03:36:56PM +0200, Pavel Machek wrote:
> On Fri 2016-09-16 16:10:14, Greg KH wrote:
> > 
> > This driver implements the Greybus LED protocol.
> 
> I guess this should be copied to LED mainainters?

It will when it comes out of the staging directory.

> Havingstandartized phone hardware to work would be great. Is it
> possible to get device using this?

Yes, Motorolla ships a phone with this hardware in it.

thanks,

greg k-h
