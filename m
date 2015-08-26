From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/configs: Enable LEDS support
Date: Wed, 26 Aug 2015 10:26:12 +1000
Message-ID: <m3a8teopy3.fsf@oc8180480414.ibm.com>
References: <1440489254-8162-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:39999 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756105AbbHZA0T (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 25 Aug 2015 20:26:19 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <stewart@linux.vnet.ibm.com>;
	Tue, 25 Aug 2015 18:26:19 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 8D2CF3E40041
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2015 18:26:16 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t7Q0PH5p43385044
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2015 17:25:17 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t7Q0QFZg030182
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2015 18:26:16 -0600
In-Reply-To: <1440489254-8162-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, j.anaszewski@samsung.com, linux-leds@vger.kernel.org

Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
> Presently PowerNV LEDS driver is specific to FSP based PowerNV
> platform. Hence added it as 'm'. So that we will be loaded only
> if we have required device tree support.

Currently the *firmware* support is FSP specific.

The driver should magically work on any OPAL machine that hooks up the
OPAL calls and DT. Right?

The A in OPAL is for Abstraction, not P for Passthrough-to-fsp.
