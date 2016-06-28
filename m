From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v6 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Tue, 28 Jun 2016 17:42:54 +0300
Message-ID: <20160628144254.GL1711@lahna.fi.intel.com>
References: <1467107065-11338-1-git-send-email-tony.makkiel@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:4813 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751068AbcF1Onj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 28 Jun 2016 10:43:39 -0400
Content-Disposition: inline
In-Reply-To: <1467107065-11338-1-git-send-email-tony.makkiel@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org

On Tue, Jun 28, 2016 at 10:44:25AM +0100, Tony Makkiel wrote:
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id lp3952_acpi_match[] = {
> +	{LP3952_ACPI_NAME, 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> +#endif

Do you actually have ACPI system with this device included or are you
just making this up? If there is no such system please consider dropping
ACPI probing support from the driver. It can be added later if actually
found on some real system.
