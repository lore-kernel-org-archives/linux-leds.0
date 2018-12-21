From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 6/7] arm64: dts: xilinx: ultra96: Standardize LED
 labels and triggers
Date: Fri, 21 Dec 2018 08:07:08 +0530
Message-ID: <20181221023708.GC3233@Mani-XPS-13-9360>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org>
 <20181029094245.7886-7-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181029094245.7886-7-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: michal.simek@xilinx.com
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, koen.kooi@linaro.org, nicolas.dechesne@linaro.org
List-Id: linux-leds@vger.kernel.org

On Mon, Oct 29, 2018 at 03:12:44PM +0530, Manivannan Sadhasivam wrote:
> For all 96Boards, the following standard is used for onboard LEDs.
> 
> green:user1  default-trigger: heartbeat
> green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
> green:user3  default-trigger: mmc1 (SD-card)
> green:user4  default-trigger: none, panic-indicator
> yellow:wlan  default-trigger: phy0tx
> blue:bt      default-trigger: hci0-power
> 
> So lets adopt the same for Ultra96, which is one of the 96Boards
> CE and AI platform. Since the WLAN and BT LEDs are hardwired onboard,
> consolidate only User LEDs.
> 

Hello,

Any update on this patch?

Regards,
Mani

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index eb5e8bddb610..c08a8753215b 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -57,29 +57,30 @@
>  	leds {
>  		compatible = "gpio-leds";
>  		ds2 {
> -			label = "ds2";
> +			label = "green:user1";
>  			gpios = <&gpio 20 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
>  		ds3 {
> -			label = "ds3";
> +			label = "green:user2";
>  			gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "phy0tx"; /* WLAN tx */
> +			linux,default-trigger = "mmc0";
>  			default-state = "off";
>  		};
>  
>  		ds4 {
> -			label = "ds4";
> +			label = "green:user3";
>  			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "phy0rx"; /* WLAN rx */
> +			linux,default-trigger = "mmc1";
>  			default-state = "off";
>  		};
>  
>  		ds5 {
> -			label = "ds5";
> +			label = "green:user4";
>  			gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "bluetooth-power";
> +			linux,default-trigger = "none";
> +			panic-indicator;
>  		};
>  
>  		vbus_det { /* U5 USB5744 VBUS detection via MIO25 */
> -- 
> 2.17.1
> 
