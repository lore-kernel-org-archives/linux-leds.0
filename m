From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 1/3] usb: gadget: Refactor request completion
Date: Wed, 24 Sep 2014 11:08:16 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
References: <874mvyahcd.fsf@steelpick.2x.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:38955 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751600AbaIXPIR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Sep 2014 11:08:17 -0400
In-Reply-To: <874mvyahcd.fsf@steelpick.2x.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Michal Sojka <sojka@merica.cz>
Cc: Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz

On Tue, 23 Sep 2014, Michal Sojka wrote:

> >> +/**
> >> + * usb_gadget_giveback_request - give the request back to the gadget layer
> >> + * Context: in_interrupt()
> >> + *
> >> + * This is called by device controller drivers in order to return the
> >> + * completed request back to the gadget layer.
> >> + */
> >> +void usb_gadget_giveback_request(struct usb_ep *ep,
> >> +		struct usb_request *req)
> >> +{
> >> +	if (likely(req->complete))
> >> +		req->complete(ep, req);
> >> +	else
> >> +		pr_err("%s : req->complete must not be NULL\n", __func__);
> >
> > let it Oops. We require ->complete to be valid, if there's any gadget
> > driver not setting ->complete, it deserves to oops so we can the
> > error.
> 
> The Oops was there before, but I removed it because greg k-h didn't want
> it. See http://marc.info/?l=linux-usb&m=140917381611947&w=2. Do you
> still want the oops here?

Greg didn't want you to add a BUG() statement, whereas Felipe wants you
to leave out the "if" test and pr_err().  Just omit both, and everyone
will be satisfied.

Alan Stern
