Return-Path: <SRS0=BIkm=DD=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA7BC2D0A8
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 18:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D93220759
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 18:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgIZSZZ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 26 Sep 2020 14:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZSZY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 14:25:24 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C974C0613CE;
        Sat, 26 Sep 2020 11:25:24 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 239CB140A6F;
        Sat, 26 Sep 2020 20:25:22 +0200 (CEST)
Date:   Sat, 26 Sep 2020 20:25:21 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v2 5/7] Documentation/ABI: Add iei-wt61p803-puzzle
 driver sysfs interface documentation
Message-ID: <20200926202521.100d17f8@nic.cz>
In-Reply-To: <20200926135514.26189-6-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
        <20200926135514.26189-6-luka.kovacic@sartura.hr>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 26 Sep 2020 15:55:12 +0200
Luka Kovacic <luka.kovacic@sartura.hr> wrote:

> Add the iei-wt61p803-puzzle driver sysfs interface documentation to allow
> monitoring and control of the microcontroller from user space.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../stable/sysfs-driver-iei-wt61p803-puzzle   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle b/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
> new file mode 100644
> index 000000000000..36fca70d66ef
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle

I think this should go to testing, not stable. It should go to stable
only after it is stable for some time.

> @@ -0,0 +1,65 @@
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/mac_address_*
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the internal iEi WT61P803 PUZZLE MCU MAC address values.
> +		These are factory assigned and can be changed.
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/serial_number
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the internal iEi WT61P803 PUZZLE MCU serial number.
> +		This value is factory assigned and can be changed.
> +

Please use (RO) and (RW) prefixes before the Description, instead of
writing "This value is read only", i.e.:
  Description: (RO) Internal ... serial number.

JFI: Why can these values be changed? Shouldn't they be burned into OTP?

Marek

> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/version
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the internal iEi WT61P803 PUZZLE MCU version.
> +		This value is read only.
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/protocol_version
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the internal iEi WT61P803 PUZZLE MCU protocol version.
> +		This value is read only.
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_loss_recovery
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the iEi WT61P803 PUZZLE MCU power loss recovery value.
> +		This value is read write.
> +		Value mapping: 0 - Always-On, 1 - Always-Off, 2 - Always-AC, 3 - Always-WA
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/bootloader_mode
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read whether the MCU is in bootloader mode.
> +		This value is read only.
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the iEi WT61P803 PUZZLE MCU power status. Power status indicates
> +		the power on method.
> +		This value is read only.
> +		Value mapping (bitwise list):
> +		0x80 - Null
> +		0x40 - Firmware flag
> +		0x20 - Power loss detection flag (powered off)
> +		0x10 - Power loss detection flag (AC mode)
> +		0x08 - Button power on
> +		0x04 - WOL power on
> +		0x02 - RTC alarm power on
> +		0x01 - AC recover power on
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/build_info
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the iEi WT61P803 PUZZLE MCU firmware build date.
> +		This value is read only.
> +		Format: yyyy/mm/dd hh:mm
> +
> +What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status
> +Date:		September 2020
> +Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
> +Description:	Read the iEi WT61P803 PUZZLE MCU AC recovery status.
> +		This value is read only.

