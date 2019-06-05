From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable
 flexible
Date: Wed, 5 Jun 2019 07:47:50 -0500
Message-ID: <054c3715-e85f-e052-faf1-057bf3a67d45@ti.com>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-2-dmurphy@ti.com> <20190605100132.GL2456@sirena.org.uk>
 <7ba7a633-1a39-adcc-e942-12c0eb7c3b16@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ba7a633-1a39-adcc-e942-12c0eb7c3b16@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Mark

On 6/5/19 7:02 AM, Dan Murphy wrote:
> Mark
>
> On 6/5/19 5:01 AM, Mark Brown wrote:
>> On Tue, Jun 04, 2019 at 12:43:40PM -0500, Dan Murphy wrote:
>>> The use of and enablement of the GPIO can be used across devices.
>>> Use the enable_reg in the regulator descriptor for the register to
>>> write.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> ---
>>>
>>> v5 - No changes to the patch changes requested in this patch were 
>>> done in
>>> patch 4 of this series - 
>>> https://lore.kernel.org/patchwork/patch/1077408/
>> I was expecting this patch to just be completely dropped?  It looks like
>> the end result is very similar, we're still using enable_reg to get the
>> register and I don't see new validation added in patch 4.
>
> I can squash patch 1 into 4.
>
> Also not sure what you mean by new validation.
>
Disregard I understand.  The patch is missing the validation code.


> Please comment on patch 4 to what you are looking for
>
> Dan
>
