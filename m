From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] leds: Add user LED driver for NIC78bx device
Date: Mon, 31 Oct 2016 10:47:04 +0200
Message-ID: <20161031084704.GI23812@lahna.fi.intel.com>
References: <CGME20161027110331epcas3p332bf735529a71e5c5efa66adf4312785@epcas3p3.samsung.com>
 <1477566173-124969-1-git-send-email-hui.chun.ong@ni.com>
 <d61aa980-9519-df29-6fef-cc6e4ac182d6@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:20029 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1763068AbcJaIzx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 31 Oct 2016 04:55:53 -0400
Content-Disposition: inline
In-Reply-To: <d61aa980-9519-df29-6fef-cc6e4ac182d6@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hui Chun Ong <hui.chun.ong@ni.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jonathan.hearn@ni.com, julia.cartwright@ni.com, Brad Mouring <brad.mouring@ni.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Fri, Oct 28, 2016 at 12:08:57PM +0200, Jacek Anaszewski wrote:
> > +static struct platform_driver led_driver = {
> > +	.probe = ni78bx_add,
> > +	.remove = ni78bx_remove,
> > +	.driver = {
> > +		.name = KBUILD_MODNAME,
> > +		.acpi_match_table = ACPI_PTR(led_device_ids),
> 
> Please CC ACPI maintainers always if you include acpi.h
> Cc Rafael and Mika.

>From ACPI perspective this driver looks fine to me now.
