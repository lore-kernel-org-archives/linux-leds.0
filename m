From: Michal Sojka <sojka@merica.cz>
Subject: Re: [PATCH v6 2/4] usb: gadget: Refactor request completion
Date: Mon, 29 Sep 2014 11:13:33 +0200
Message-ID: <87sijassaq.fsf@steelpick.2x.cz>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org> <1411591401-5874-1-git-send-email-sojka@merica.cz> <1411591401-5874-3-git-send-email-sojka@merica.cz> <54291D3A.6070106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from max.feld.cvut.cz ([147.32.192.36]:40057 "EHLO max.feld.cvut.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751343AbaI2JNl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 29 Sep 2014 05:13:41 -0400
In-Reply-To: <54291D3A.6070106@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Robert Baldyga <r.baldyga@samsung.com>, linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz

On Mon, Sep 29 2014, Robert Baldyga wrote:
> Hi,
>
> On 09/24/2014 10:43 PM, Michal Sojka wrote:
>> Use the recently introduced usb_gadget_giveback_request() in favor of
>> direct invocation of the completion routine.
>> 
>> All places in drivers/usb/ matching "[-.]complete(" were replaced with a
>> call to usb_gadget_giveback_request(). This was compile-tested with all
>> ARM drivers enabled and runtime-tested for musb.
>> 
>> Signed-off-by: Michal Sojka <sojka@merica.cz>

[...]

>> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
>> index 7324308..dd18ea3 100644
>> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
>> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
>> @@ -118,10 +118,7 @@ static void done(struct qe_ep *ep, struct qe_req *req, int status)
>>  	ep->stopped = 1;
>>  	spin_unlock(&udc->lock);
>>  
>> -	/* this complete() should a func implemented by gadget layer,
>> -	 * eg fsg->bulk_in_complete() */
>> -	if (req->req.complete)
>> -		req->req.complete(&ep->ep, &req->req);
>> +	usb_gadget_giveback_request(&ep->ep, &req->req);
>
> It looks like you have omitted if() statement. Are you sure that request
> has set complete() callback?

Yes, see the rest of the thread. This was suggested by other reviewers.

-Michal
