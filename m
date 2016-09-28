From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Wed, 28 Sep 2016 12:02:41 +0200
Message-ID: <836aa19e-7b42-9c86-4f95-3b60b816454c@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-2-git-send-email-florian.vaussard@heig-vd.ch>
 <20160924115823.GA8696@amd>
Reply-To: florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160924115823.GA8696@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Le 24. 09. 16 à 13:58, Pavel Machek a écrit :
> Hi!
> 
>> +Example
>> +=======
>> +
>> +led1: ncp5623@38 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	compatible = "onnn,ncp5623";
>> +	reg = <0x38>;
>> +	onnn,led-iref-microamp = <10>;
>> +
>> +	led1r@0 {
>> +		label = "ncp:power:red";
>> +		linux,default-trigger = "default-on";
> ...
>> +	led1b@1 {
>> +		label = "ncp:power:blue";
>> +		reg = <1>;
> 
> Actually... the three LEDs are packaged such as this is one colorful
> light to the user, right? Some day we'll need to group them, so that
> kernel can automatically tell this is one led, and probably add extra
> attributes, such as values that produce white light.
> 

Actually, it's up to the hardware designer to choose. On my board for instance,
this chip is driving an RGB LED, but it can really drive three independent LEDs
if you want.

I agree that the RGB case is quite common nowadays and currently not very well
managed by the LED subsystem. But I do not think that this is specific to this
driver.

Best regards,
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
