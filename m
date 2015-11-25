From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH] leds/powernv : removing NULL check
Date: Wed, 25 Nov 2015 20:14:31 +0530
Message-ID: <5655C94F.4070504@linux.vnet.ibm.com>
References: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:37535 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093AbbKYOoi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2015 09:44:38 -0500
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 25 Nov 2015 20:14:35 +0530
In-Reply-To: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Saurabh Sengar <saurabh.truth@gmail.com>, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/23/2015 02:58 PM, Saurabh Sengar wrote:
> no need to explicitly check for pointer to be null,
> of_prop_next_string anyways return NULL, if passed pointer is NULL
> and hence loop will continue

Thanks! Patch looks good.

-Vasant
