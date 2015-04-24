From: Jacek Anaszewski <j.anaszewski81@gmail.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Fri, 24 Apr 2015 12:16:29 +0200
Message-ID: <20150424121629.69a159b3@ja.home>
References: <20150422234509.626d9dc7@ja.home>
	<55388254.4000606@linux.vnet.ibm.com>
	<20150423161342.55e9ac8f@ja.home>
	<m3egnama5l.fsf@oc8180480414.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37391 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752668AbbDXKQi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Apr 2015 06:16:38 -0400
Received: by widdi4 with SMTP id di4so14779698wid.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2015 03:16:37 -0700 (PDT)
In-Reply-To: <m3egnama5l.fsf@oc8180480414.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: linux-leds@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, khandual@linux.vnet.ibm.com

On Fri, 24 Apr 2015 14:18:30 +1000
Stewart Smith <stewart@linux.vnet.ibm.com> wrote:

> Jacek Anaszewski <j.anaszewski81@gmail.com> writes:
> >> These device tree comes from out firmware ... which is immutable .
> >
> > How the firmware is related to kernel? These bindings are for
> > kernel, not for the firmware.
> >
> > DT bindings are compiled to *.dtb file which is concatenated with
> > zImage. During system boot device drivers are matched with DT
> > bindings through 'compatible' property. A driver should have single
> > matching DT node, i.e. no other driver can probe with the same DT
> > node. This implies that the node should contain only the properties
> > required for configuring the related device.
> 
> For OPAL firmware on POWER, firmware hands kernel a flattened device
> tree of the machine it's booting on. It's not added to kernel as the
> kernels aren't board specific - they're generic.

Is the DT node we are discussing used by some other drivers than the
LED class driver? Or is it required in this form by other components of
your platform?

> https://github.com/open-power/skiboot/ is the firmware that generates
> the device tree for booting under OPAL.
> 


-- 
Best Regards,
Jacek Anaszewski
