From: "Wu Fenglin" <fenglinw@codeaurora.org>
Subject: RE: [PATCH V1 1/2] leds: leds-qti-rgb: Add LED driver for QTI TRI_LED module
Date: Thu, 1 Jun 2017 08:30:19 +0800
Message-ID: <002d01d2da6e$42a987b0$c7fc9710$@codeaurora.org>
References: <20170531061541.10808-1-fenglinw@codeaurora.org> <20170531061541.10808-2-fenglinw@codeaurora.org> <20170531075536.GA13028@amd> <001301d2d9e7$3102b720$93082560$@codeaurora.org> <20170531165540.GA9371@amd>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170531165540.GA9371@amd>
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
To: 'Pavel Machek' <pavel@ucw.cz>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, 'Rob Herring' <robh+dt@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-leds@vger.kernel.org

Thanks Pavel.
I will remove these two dts properties and define the default on/off time
values in C code.

--
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux
Foundation Collaborative Project.
