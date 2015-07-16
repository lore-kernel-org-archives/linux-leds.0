From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 3/3] leds/powernv: Add driver for PowerNV platform
Date: Thu, 16 Jul 2015 18:47:08 +1000
Message-ID: <1437036428.15828.1.camel@ellerman.id.au>
References: <1435740638-16259-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
	 <1435740638-16259-4-git-send-email-hegdevasant@linux.vnet.ibm.com>
	 <55A4CFA0.6090306@samsung.com> <55A75541.4060008@linux.vnet.ibm.com>
	 <55A76AF6.2090805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53552 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752396AbbGPIrR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 16 Jul 2015 04:47:17 -0400
In-Reply-To: <55A76AF6.2090805@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, stewart@linux.vnet.ibm.com, arnd@arndb.de, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, khandual@linux.vnet.ibm.com

On Thu, 2015-07-16 at 10:27 +0200, Jacek Anaszewski wrote:
> On 07/16/2015 08:54 AM, Vasant Hegde wrote:
> >>> +static enum led_brightness powernv_led_get(struct led_classdev *led_cdev)
> >>> +{
> >>> +    char *loc_code;
> >>> +    int rc, led_type;
> >>> +    __be64 led_mask, led_value, max_led_type;
> >>> +
> >>> +    led_type = powernv_get_led_type(led_cdev);
> >>> +    if (led_type == -1)
> >>> +        return LED_OFF;
> >>> +
> >>> +    loc_code = powernv_get_location_code(led_cdev);
> >>> +    if (!loc_code)
> >>> +        return LED_OFF;
> >>> +
> >>> +    /* Fetch all LED status */
> >>> +    led_mask = cpu_to_be64(0);
> >>> +    led_value = cpu_to_be64(0);
> >>> +    max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
> >>> +
> >>> +    rc = opal_leds_get_ind(loc_code, &led_mask, &led_value, &max_led_type);
> >>> +    if (rc != OPAL_SUCCESS && rc != OPAL_PARTIAL) {
> >>> +        dev_err(led_cdev->dev,
> >>> +            "%s: OPAL get led call failed [rc=%d]\n",
> >>> +            __func__, rc);
> >>> +        goto led_fail;
> >>> +    }
> >>> +
> >>> +    led_mask = be64_to_cpu(led_mask);
> >>> +    led_value = be64_to_cpu(led_value);
> >>
> >> be64_to_cpu result should be assigned to the variable of u64/s64 type.
> >
> > PowerNV platform is capable of running both big/little endian mode.. But
> > presently our firmware is big endian. These variable contains big endian values.
> > Hence I have created as __be64 .. (This is the convention we follow in other
> > places as well).
> 
> It is correct that the argument is of __be64 type, but be64_to_cpu
> returns u64 type, whereas you assign it to  __be64.

Yeah that's wrong. You are using led_mask etc as __be64 when you pass them to
firmware, which is correct, but then you're also using them as the lvalue of
be64_to_cpu() which returns a u64.

Sparse should warn you about that if you use it, please do.

$ apt-get install sparse
$ cd kernel
$ make C=2 CF=-D__CHECK_ENDIAN__


Whether the kernel or OPAL is running big or little endian is irrelevant to all
of this. The OPAL API defines that parameters to OPAL calls are big endian, and
that's all that matters:

  https://github.com/open-power/skiboot/blob/master/doc/opal-spec.txt#L142


Thanks for the review Jacek.

cheers
