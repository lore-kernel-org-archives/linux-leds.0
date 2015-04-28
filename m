From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 3/3] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Apr 2015 12:18:22 +0200
Message-ID: <5316346.zPr516JNgQ@wuerfel>
References: <20150428100535.26912.29607.stgit@localhost.localdomain> <20150428101008.26912.38735.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:51686 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965271AbbD1KS3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 06:18:29 -0400
In-Reply-To: <20150428101008.26912.38735.stgit@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

On Tuesday 28 April 2015 15:40:35 Vasant Hegde wrote:
> +++ b/Documentation/devicetree/bindings/leds/leds-powernv.txt
> @@ -0,0 +1,29 @@
> +Device Tree binding for LEDs on IBM Power Systems
> +-------------------------------------------------
> +
> +The 'led' node under '/ibm,opal' lists service indicators available in the
> +system and their capabilities.
> +
> +led {
> +       compatible = "ibm,opal-v3-led";
> +       phandle = <0x1000006b>;
> +       linux,phandle = <0x1000006b>;
> +       led-mode = "lightpath";
> +
> +       U78C9.001.RST0027-P1-C1 {
> +               led-types = "identify", "fault";
> +               led-loc = "descendent";
> +               phandle = <0x1000006f>;
> +               linux,phandle = <0x1000006f>;
> +       };
> +       ...
> +       ...
> +};

We normally don't list the 'phandle' or 'linux,phandle' properties in the binding
description.

> +
> +Each node under 'led' node describes location code of FRU/Enclosure.
> +
> +The properties under each node:
> +
> +  led-types : Supported LED types (attention/identify/fault).
> +
> +  led-loc   : enclosure/descendent(FRU) location code.
> 

Could you use the standard 'label' property for this?

	Arnd
