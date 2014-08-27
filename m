From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 1/3] usb: gadget: Refactor request completion
Date: Wed, 27 Aug 2014 17:03:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1408271701560.1460-100000@iolanthe.rowland.org>
References: <1409173080-13921-2-git-send-email-sojka@merica.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:53759 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S965084AbaH0VDm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 Aug 2014 17:03:42 -0400
In-Reply-To: <1409173080-13921-2-git-send-email-sojka@merica.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Michal Sojka <sojka@merica.cz>
Cc: linux-usb@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz

On Wed, 27 Aug 2014, Michal Sojka wrote:

> +/**
> + * usb_gadget_giveback_request - give the request back to the gadget layer
> + * Context: in_interrupt()
> + *
> + * This is called by device controller drivers in order to return the
> + * completed request back to the gadget layer.
> + */
> +void usb_gadget_giveback_request(struct usb_ep *ep,
> +		struct usb_request *req)
> +{
> +	BUG_ON(req->complete == NULL);
> +	req->complete(ep, req);
> +}

I guess it doesn't hurt to have the BUG_ON, but it doesn't help either.  
Think about what would happen if req->complete was NULL and the BUG_ON 
wasn't present.

Alan Stern
