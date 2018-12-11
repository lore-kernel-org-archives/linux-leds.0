From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 1/7] arm64: dts: rockchip: ficus: Add on-board LED support
Date: Tue, 11 Dec 2018 20:11:13 +0100
Message-ID: <44132232.o28PC2y76u@phil>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org> <20181029094245.7886-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029094245.7886-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: robh@kernel.org, ezequiel@collabora.com, xuwei5@hisilicon.com, michal.simek@xilinx.com, pavel@ucw.cz, andy.gross@linaro.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, koen.kooi@linaro.org, nicolas.dechesne@linaro.org
List-Id: linux-leds@vger.kernel.org

Am Montag, 29. Oktober 2018, 10:42:39 CET schrieb Manivannan Sadhasivam:
> Add on-board LED support for Ficus board based on the following
> standard used by other 96Boards:
> 
> red:user1  default-trigger: heartbeat
> red:user2  default-trigger: mmc0/disk-activity (onboard-storage)
> red:user3  default-trigger: mmc1 (SD-card)
> red:user4  default-trigger: none, panic-indicator
> red:wlan   default-trigger: phy0tx
> red:bt     default-trigger: hci0-power
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

applied for 4.21

Thanks
Heiko
