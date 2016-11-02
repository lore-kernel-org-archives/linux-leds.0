From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] leds: Add user LED driver for NIC78bx device
Date: Wed, 2 Nov 2016 12:00:23 +0200
Message-ID: <20161102100023.GF1436@lahna.fi.intel.com>
References: <CGME20161027110331epcas3p332bf735529a71e5c5efa66adf4312785@epcas3p3.samsung.com>
 <1477566173-124969-1-git-send-email-hui.chun.ong@ni.com>
 <d61aa980-9519-df29-6fef-cc6e4ac182d6@samsung.com>
 <20161031084704.GI23812@lahna.fi.intel.com>
 <f0d7f5bf-c8c3-0946-1b37-228a7dd6deeb@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:6295 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754696AbcKBKCp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 2 Nov 2016 06:02:45 -0400
Content-Disposition: inline
In-Reply-To: <f0d7f5bf-c8c3-0946-1b37-228a7dd6deeb@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hui Chun Ong <hui.chun.ong@ni.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jonathan.hearn@ni.com, julia.cartwright@ni.com, Brad Mouring <brad.mouring@ni.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Wed, Nov 02, 2016 at 09:22:44AM +0100, Jacek Anaszewski wrote:
> Hi Mika,
> 
> On 10/31/2016 09:47 AM, Mika Westerberg wrote:
> > On Fri, Oct 28, 2016 at 12:08:57PM +0200, Jacek Anaszewski wrote:
> > > > +static struct platform_driver led_driver = {
> > > > +	.probe = ni78bx_add,
> > > > +	.remove = ni78bx_remove,
> > > > +	.driver = {
> > > > +		.name = KBUILD_MODNAME,
> > > > +		.acpi_match_table = ACPI_PTR(led_device_ids),
> > > 
> > > Please CC ACPI maintainers always if you include acpi.h
> > > Cc Rafael and Mika.
> > 
> > > From ACPI perspective this driver looks fine to me now.
> 
> Thanks for the review. Can I add your Acked-by then?

Sure,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
