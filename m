From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 5/5] leds: lm36274: Introduce the TI LM36274 LED driver
Date: Thu, 6 Jun 2019 06:25:24 -0500
Message-ID: <f10b8877-9e1a-0011-1a25-e8c0bc8fcd22@ti.com>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-6-dmurphy@ti.com> <20190606100759.GB1825@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606100759.GB1825@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: jacek.anaszewski@gmail.com, broonie@kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 6/6/19 5:07 AM, Pavel Machek wrote:
> On Wed 2019-06-05 07:56:34, Dan Murphy wrote:
>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>> MFD driver to probe this LED driver.  The driver configures only the
>> LED registers and enables the outputs according to the config file.
>>
>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>> framework to set the brightness bits.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Actually, one more thing. Not too important, but.. how did Jacek's
> signoff get there? He should add his signoff when he applies it to the
> git...
>
This signoff came from the ti-lmu-led-drivers branch that Jacek created 
in his linux-leds repo.

Unfortunately that branch does not seem to exist now so Jacek would need 
to confirm this.

Dan
