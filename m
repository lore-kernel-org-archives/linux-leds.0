From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v3 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 16 Oct 2017 13:42:11 -0700
Message-ID: <20171016204211.GA14419@fury>
References: <1505142759-160534-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:34499 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752892AbdJPUmO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Oct 2017 16:42:14 -0400
Content-Disposition: inline
In-Reply-To: <1505142759-160534-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: gregkh@linuxfoundation.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, pavel@ucw.cz

On Mon, Sep 11, 2017 at 03:12:36PM +0000, Vadim Pasternak wrote:
> The patchset modifies x86/mlxcpld-hotplug.c for making it architecture
> independent, renames to mlxreg-hotplug and moves it from
> drivers/platform/x86 folder to new drivers/platform/mellanox folder.
> This modification also introduces regmap interface for mlxreg-hotplug
> driver to allow hotplug event functionality over programmable devices
> logic, when these devices can be attached to different interfaces types,
> like I2C, LPC, SPI.
> Module include/linux/platform_data/mlxcpld-hotplug.h is removed and new
> module include/linux/platform_data/mlxreg.h is to be used instead.
> Driver drivers/platform/x86/mlx-platform.c is updated according to new
> interface.
> Relevant Makefile and Kconfig are updated.
> 

Hi Vadim,

This didn't really land under anyone's maintainer domain. Apologies for
the long response time here.

I am happy to include the new platform/mellanox tree within the
platform-driver-x86 purvue, as we have done with platform/chrome. If
anyone objects, or would prefer to take this through their tree - please
let me know.

With respect to the series itself, the patches are not done in a way
that lend themselves to incremental review. The cover letter above says
the mlxcpld-hotplug driver is:

1) made architecture independent 2) renamed to mlxreg-hotplug 3) Moved
to platform/mellanox/

But the series does the following:

1) Create a new platform/mellanox/mlxreg-hotplug driver 2) Modify
mlx-platform to use the new driver 3) Delete mlxcpld-hotplug driver

This makes it very difficult to review the incremental changes to the
hotplug driver. Please refactor the patches to take the follow approach:

1) Use git-mv to move x86/mlxcpld-hotplug to mellanox/mlxreg-hotplug,
add the necessary Kconfig and Makefile entries, and update mlx-platform
to use the correct header. No functional changes. This gives us a
starting point for the next steps.

2) Make mlxreg-hotplug architecture independent 3) Add the new regmap
interface

Give some thought to what the incremental functional changes should be
(2,3 above are just an example). This will become more apparent to the
reviewer once the changes come in after the mv.

You'll want to add Andy and Myself and the platform-driver-x86 mailing
list to the MAINTAINERS file for platform/mellanox as we will still be
responsible for reviewing the patches and submitting the pull requests
to Linus.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
