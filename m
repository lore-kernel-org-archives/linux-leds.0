From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Tue, 17 Feb 2015 15:35:14 -0800
Message-ID: <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com> <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:56532 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbbBQXfg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 18:35:36 -0500
In-Reply-To: <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2015 at 2:54 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hello Bryan
>
> On Tue, Feb 17, 2015 at 11:34 PM, Bryan Wu <cooloney@gmail.com> wrote:
>>
>> Can you show me your device tree code for overlaying describing a camera?
>>
>
> The camera is composed by fpga modules. The fpga is attached via pcie
> to the host.
>
> The whole dt would be too long.
>
> Here you can see the relevant parts
>
> &axi1 {
>
>
> packer_0: packer_0{
> #address-cells = <1>;
> #size-cells = <1>;
>     compatible = "qtec,axi_matrix_packer-1.00.a";
> reg = < 0x30060000 0x10000 >;
> qtec,serial_number = "Invalid Head Serial Number";
> qtec,bitstream_version = < 0 >;
> qtec,head_i2c_address = < 0 >;
> qtec,cdma = <&cdma_0>;
> qtec,desc_mem= <&cdma_desc_mem>;
> qtec,pcie_bridge= <&pcie_bridge_0>;
> qtec,aperture-addr= < 0  4 >;
> qtec,circular_buffer= <&video_mem>;
> qtec,white_balance= <&white_0>;
> qtec,sensor = <&ccd_fg_0>;
> qtec,pll = < &pll_0 >;
> qtec,xform = <&xform_0>;
> qtec,testgen = <&testgen_0>;
> qtec,encoder = <&encoder_0>;
> interrupt-parent = <&xps_intc_0>;
> interrupts = < 5 2 >;
> };
>
> gpio_0: gpio_0 {
> #gpio-cells = <2>;
> compatible = "xlnx,xps-gpio-1.00.a";
> reg = < 0x30040000 010000 >;
> xlnx,dout-default = < 0xffffffff >;
> xlnx,tri-default =  < 0xfffffff8 >;
> xlnx,gpio-width = < 5 >;
> };
>
>
> /*Leds*/
> leds {
> reg = < 0x30040000 010000 >;
> compatible = "gpio-leds";
> red {

So why not use name "red0" and name another one "red1"? since you have
multiple different red leds here any way.

-Bryan

> gpios = <&gpio_0 0 0>;
> linux,default-trigger = "drop-qt5023_video0";
> };
> yellow {
> gpios = <&gpio_0 1 0>;
> linux,default-trigger = "packer-qt5023_video0";
> };
> green {
> gpios = <&gpio_0 2 0>;
> linux,default-trigger = "heartbeat";
> };
> };
>
>
> If there are multiple cameras, then there will be multiple red, yellow
> and green leds, throwing out the error I copied earlier.
>
>
> Thanks!
>
> --
> Ricardo Ribalda
